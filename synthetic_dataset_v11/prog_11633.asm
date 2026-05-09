; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (179, 101) spanning 37 by 93 pixels. Then Places a red dot at position (215, 239).
; PLAN: r0=179(x), r1=101(y), r2=37(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=215(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (179, 101) spanning 37 by 93 pixels.
; PLAN: r0=179(x), r1=101(y), r2=37(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 101
LDI r2, 37
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (215, 239).
; PLAN: r0=215(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 239
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
