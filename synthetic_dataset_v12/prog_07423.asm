; DESCRIPTION: Composite: Renders a cyan line between points (73, 228) and (431, 228) then Renders a red box of size 61x39 starting at (75, 97).
; PLAN: r0=73(x1), r1=228(y1), r2=431(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=97(y), r7=61(width), r8=39(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 228
LDI r2, 431
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 97
LDI r7, 61
LDI r8, 39
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
