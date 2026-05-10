; DESCRIPTION: Renders a cyan box of size 19x79 starting at (72, 152).
; PLAN: r0=72(x), r1=152(y), r2=19(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 152
LDI r2, 19
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
