; DESCRIPTION: Composite: . Then Places a cyan dot at position (216, 70). Then Renders a orange box of size 60x46 starting at (32, 62).
; PLAN: r0=216(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=32(x), r1=62(y), r2=60(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (216, 70).
; PLAN: r0=216(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 60x46 starting at (32, 62).
; PLAN: r0=32(x), r1=62(y), r2=60(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 62
LDI r2, 60
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
