; DESCRIPTION: Renders a cyan box of size 30x84 starting at (366, 152).
; PLAN: r0=366(x), r1=152(y), r2=30(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 152
LDI r2, 30
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
