; DESCRIPTION: Places a cyan 90x52 rectangle at position (56, 152).
; PLAN: r0=56(x), r1=152(y), r2=90(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 152
LDI r2, 90
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
