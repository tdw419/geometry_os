; DESCRIPTION: Places a yellow 79x55 rectangle at position (336, 172).
; PLAN: r0=336(x), r1=172(y), r2=79(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 172
LDI r2, 79
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
