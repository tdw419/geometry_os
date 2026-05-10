; DESCRIPTION: Composite: Creates a cyan rectangular region at (394, 39) spanning 98 by 61 pixels then Draws a cyan line from (208, 107) to (156, 153).
; PLAN: r0=394(x), r1=39(y), r2=98(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x1), r6=107(y1), r7=156(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 39
LDI r2, 98
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 107
LDI r7, 156
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
