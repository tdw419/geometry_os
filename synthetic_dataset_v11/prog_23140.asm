; DESCRIPTION: Composite: . Then Creates a green rectangular region at (46, 91) spanning 27 by 57 pixels. Then Places a black dot at position (174, 117).
; PLAN: r0=46(x), r1=91(y), r2=27(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=174(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (46, 91) spanning 27 by 57 pixels.
; PLAN: r0=46(x), r1=91(y), r2=27(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 91
LDI r2, 27
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (174, 117).
; PLAN: r0=174(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
HALT
