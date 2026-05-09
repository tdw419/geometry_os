; DESCRIPTION: Composite: . Then Places a white 37x77 rectangle at position (121, 87). Then Places a blue dot at position (180, 231).
; PLAN: r0=121(x), r1=87(y), r2=37(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 37x77 rectangle at position (121, 87).
; PLAN: r0=121(x), r1=87(y), r2=37(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 87
LDI r2, 37
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (180, 231).
; PLAN: r0=180(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
