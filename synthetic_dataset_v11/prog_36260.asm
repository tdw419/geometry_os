; DESCRIPTION: Places a green 10x44 rectangle at position (218, 210).
; PLAN: r0=218(x), r1=210(y), r2=10(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 210
LDI r2, 10
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
