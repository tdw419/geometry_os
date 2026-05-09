; DESCRIPTION: Composite: . Then Places a red dot at position (151, 74). Then Creates a cyan rectangular region at (126, 154) spanning 17 by 27 pixels.
; PLAN: r0=151(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=154(y), r2=17(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (151, 74).
; PLAN: r0=151(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (126, 154) spanning 17 by 27 pixels.
; PLAN: r0=126(x), r1=154(y), r2=17(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 154
LDI r2, 17
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
