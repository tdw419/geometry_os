; DESCRIPTION: Renders a green box of size 104x116 starting at (152, 136).
; PLAN: r0=152(x), r1=136(y), r2=104(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 136
LDI r2, 104
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
