; DESCRIPTION: Composite: . Then Places a blue dot at position (79, 116). Then Places a blue 61x70 rectangle at position (75, 164).
; PLAN: r0=79(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=164(y), r2=61(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (79, 116).
; PLAN: r0=79(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 116
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 61x70 rectangle at position (75, 164).
; PLAN: r0=75(x), r1=164(y), r2=61(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 164
LDI r2, 61
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
