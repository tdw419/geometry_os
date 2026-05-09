; DESCRIPTION: Renders a cyan box of size 106x32 starting at (200, 40).
; PLAN: r0=200(x), r1=40(y), r2=106(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 40
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
