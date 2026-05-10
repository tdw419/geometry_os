; DESCRIPTION: Composite: Creates a cyan rectangular region at (365, 198) spanning 11 by 41 pixels then Renders a magenta line between points (238, 82) and (122, 61).
; PLAN: r0=365(x), r1=198(y), r2=11(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=82(y1), r7=122(x2), r8=61(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 198
LDI r2, 11
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 82
LDI r7, 122
LDI r8, 61
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
