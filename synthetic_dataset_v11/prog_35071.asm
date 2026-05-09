; DESCRIPTION: Places a cyan 94x44 rectangle at position (144, 17).
; PLAN: r0=144(x), r1=17(y), r2=94(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 17
LDI r2, 94
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
