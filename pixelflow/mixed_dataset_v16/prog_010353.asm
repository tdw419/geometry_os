; DESCRIPTION: Places a green 102x65 box at position (173, 13).
; PLAN: r0=173(x), r1=13(y), r2=102(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 13
LDI r2, 102
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
