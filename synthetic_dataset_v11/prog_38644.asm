; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (153, 149) spanning 103 by 37 pixels. Then Places a cyan dot at position (234, 133).
; PLAN: r0=153(x), r1=149(y), r2=103(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange rectangular region at (153, 149) spanning 103 by 37 pixels.
; PLAN: r0=153(x), r1=149(y), r2=103(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 149
LDI r2, 103
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (234, 133).
; PLAN: r0=234(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
