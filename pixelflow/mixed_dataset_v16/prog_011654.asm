; DESCRIPTION: Places a white 70x89 rectangle at position (231, 143).
; PLAN: r0=231(x), r1=143(y), r2=70(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 143
LDI r2, 70
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
