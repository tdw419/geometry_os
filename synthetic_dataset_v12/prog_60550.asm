; DESCRIPTION: Composite: Places a magenta dot at position (85, 180) then Creates a cyan rectangular region at (169, 32) spanning 77 by 108 pixels.
; PLAN: r0=85(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=32(y), r7=77(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 32
LDI r7, 77
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
