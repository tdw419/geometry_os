; DESCRIPTION: Composite: . Then Places a blue dot at position (250, 231). Then Creates a cyan rectangular region at (106, 85) spanning 62 by 50 pixels.
; PLAN: r0=250(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=106(x), r1=85(y), r2=62(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (250, 231).
; PLAN: r0=250(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (106, 85) spanning 62 by 50 pixels.
; PLAN: r0=106(x), r1=85(y), r2=62(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 85
LDI r2, 62
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
