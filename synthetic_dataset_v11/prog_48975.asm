; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (74, 46) spanning 87 by 96 pixels. Then Places a orange dot at position (106, 112).
; PLAN: r0=74(x), r1=46(y), r2=87(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (74, 46) spanning 87 by 96 pixels.
; PLAN: r0=74(x), r1=46(y), r2=87(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 46
LDI r2, 87
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (106, 112).
; PLAN: r0=106(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
