; DESCRIPTION: Places a cyan 12x80 rectangle at position (213, 75).
; PLAN: r0=213(x), r1=75(y), r2=12(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 75
LDI r2, 12
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
