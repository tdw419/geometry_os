; DESCRIPTION: Composite: Places a magenta dot at position (418, 231) then Creates a purple rectangular region at (79, 96) spanning 94 by 59 pixels.
; PLAN: r0=418(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=96(y), r7=94(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 231
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 96
LDI r7, 94
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
