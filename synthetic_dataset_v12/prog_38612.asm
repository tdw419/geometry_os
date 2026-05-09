; DESCRIPTION: Composite: Places a green dot at position (181, 109) then Renders a black box of size 55x77 starting at (218, 43).
; PLAN: r0=181(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=43(y), r7=55(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 218
LDI r6, 43
LDI r7, 55
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
