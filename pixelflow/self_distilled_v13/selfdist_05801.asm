; DESCRIPTION: Places a green 76x52 box at position (218, 143).
; PLAN: r0=218(x), r1=143(y), r2=76(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 143
LDI r2, 76
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
