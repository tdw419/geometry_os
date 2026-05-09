; DESCRIPTION: Composite: Draws a cyan line from (294, 250) to (7, 92) then Renders a magenta box of size 28x75 starting at (480, 121).
; PLAN: r0=294(x1), r1=250(y1), r2=7(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=121(y), r7=28(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 250
LDI r2, 7
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 121
LDI r7, 28
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
