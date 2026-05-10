; DESCRIPTION: Composite: Places a cyan dot at position (403, 234) then Creates a red rectangular region at (161, 6) spanning 46 by 91 pixels.
; PLAN: r0=403(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=6(y), r7=46(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 6
LDI r7, 46
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
