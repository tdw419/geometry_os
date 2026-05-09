; DESCRIPTION: Composite: . Then Places a magenta dot at position (108, 81). Then Creates a cyan rectangular region at (124, 83) spanning 18 by 113 pixels.
; PLAN: r0=108(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=124(x), r1=83(y), r2=18(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (108, 81).
; PLAN: r0=108(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (124, 83) spanning 18 by 113 pixels.
; PLAN: r0=124(x), r1=83(y), r2=18(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 83
LDI r2, 18
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
