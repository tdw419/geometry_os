; DESCRIPTION: Composite: . Then Places a green dot at position (170, 161). Then Creates a cyan rectangular region at (95, 74) spanning 31 by 120 pixels.
; PLAN: r0=170(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=95(x), r1=74(y), r2=31(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (170, 161).
; PLAN: r0=170(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (95, 74) spanning 31 by 120 pixels.
; PLAN: r0=95(x), r1=74(y), r2=31(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 74
LDI r2, 31
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
