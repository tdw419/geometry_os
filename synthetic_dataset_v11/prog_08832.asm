; DESCRIPTION: Composite: . Then Places a cyan circle of radius 55 at center (106, 149). Then Places a magenta 48x87 rectangle at position (117, 85).
; PLAN: r0=106(x), r1=149(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=117(x), r1=85(y), r2=48(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 55 at center (106, 149).
; PLAN: r0=106(x), r1=149(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 149
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 48x87 rectangle at position (117, 85).
; PLAN: r0=117(x), r1=85(y), r2=48(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 48
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
