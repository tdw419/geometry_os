; DESCRIPTION: Places a black 46x109 rectangle at position (328, 70).
; PLAN: r0=328(x), r1=70(y), r2=46(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 70
LDI r2, 46
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
