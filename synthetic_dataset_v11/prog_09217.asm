; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (19, 135) spanning 30 by 119 pixels. Then Places a red dot at position (197, 144).
; PLAN: r0=19(x), r1=135(y), r2=30(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (19, 135) spanning 30 by 119 pixels.
; PLAN: r0=19(x), r1=135(y), r2=30(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 135
LDI r2, 30
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (197, 144).
; PLAN: r0=197(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
