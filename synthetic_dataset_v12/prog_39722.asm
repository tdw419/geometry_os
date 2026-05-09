; DESCRIPTION: Places a cyan 65x87 rectangle at position (417, 113).
; PLAN: r0=417(x), r1=113(y), r2=65(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 113
LDI r2, 65
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
