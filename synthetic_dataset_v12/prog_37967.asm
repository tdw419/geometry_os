; DESCRIPTION: Places a cyan 98x26 rectangle at position (373, 150).
; PLAN: r0=373(x), r1=150(y), r2=98(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 150
LDI r2, 98
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
