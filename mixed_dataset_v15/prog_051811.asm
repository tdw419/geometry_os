; DESCRIPTION: Renders a cyan box of size 38x18 starting at (271, 127).
; PLAN: r0=271(x), r1=127(y), r2=38(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 127
LDI r2, 38
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
