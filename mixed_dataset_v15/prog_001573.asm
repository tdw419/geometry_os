; DESCRIPTION: Places a blue 98x27 rectangle at position (195, 221).
; PLAN: r0=195(x), r1=221(y), r2=98(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 221
LDI r2, 98
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
