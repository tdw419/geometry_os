; DESCRIPTION: Places a orange 112x22 rectangle at position (392, 108).
; PLAN: r0=392(x), r1=108(y), r2=112(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 108
LDI r2, 112
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
