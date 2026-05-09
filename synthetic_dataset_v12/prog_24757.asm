; DESCRIPTION: Renders a cyan box of size 38x90 starting at (350, 100).
; PLAN: r0=350(x), r1=100(y), r2=38(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 100
LDI r2, 38
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
