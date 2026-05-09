; DESCRIPTION: Renders a cyan box of size 62x104 starting at (121, 152).
; PLAN: r0=121(x), r1=152(y), r2=62(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 152
LDI r2, 62
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
