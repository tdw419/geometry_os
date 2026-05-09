; DESCRIPTION: Places a green 21x55 rectangle at position (208, 165).
; PLAN: r0=208(x), r1=165(y), r2=21(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 165
LDI r2, 21
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
