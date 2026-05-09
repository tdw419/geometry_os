; DESCRIPTION: Places a cyan 80x75 rectangle at position (77, 38).
; PLAN: r0=77(x), r1=38(y), r2=80(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 38
LDI r2, 80
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
