; DESCRIPTION: Places a yellow 107x16 rectangle at position (335, 152).
; PLAN: r0=335(x), r1=152(y), r2=107(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 152
LDI r2, 107
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
