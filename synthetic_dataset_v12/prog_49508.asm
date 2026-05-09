; DESCRIPTION: Places a cyan 31x77 rectangle at position (260, 21).
; PLAN: r0=260(x), r1=21(y), r2=31(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 21
LDI r2, 31
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
