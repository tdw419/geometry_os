; DESCRIPTION: Composite: Sets a single cyan pixel at (186, 90) then Renders a red box of size 50x120 starting at (144, 54).
; PLAN: r0=186(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=54(y), r7=50(width), r8=120(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 54
LDI r7, 50
LDI r8, 120
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
