; DESCRIPTION: Creates a cyan rectangular region at (260, 120) spanning 31 by 89 pixels.
; PLAN: r0=260(x), r1=120(y), r2=31(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 120
LDI r2, 31
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
