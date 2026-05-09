; DESCRIPTION: Places a cyan 80x75 rectangle at position (264, 37).
; PLAN: r0=264(x), r1=37(y), r2=80(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 37
LDI r2, 80
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
