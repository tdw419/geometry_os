; DESCRIPTION: Renders a cyan box of size 40x120 starting at (271, 90).
; PLAN: r0=271(x), r1=90(y), r2=40(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 90
LDI r2, 40
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
