; DESCRIPTION: Composite: Places a magenta dot at position (189, 112) then Creates a white rectangular region at (218, 143) spanning 46 by 48 pixels.
; PLAN: r0=189(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=143(y), r7=46(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 143
LDI r7, 46
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
