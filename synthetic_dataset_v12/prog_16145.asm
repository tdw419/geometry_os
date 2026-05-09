; DESCRIPTION: Composite: Sets a single cyan pixel at (193, 255) then Draws a orange rectangle at (374, 152) with width 70 and height 101.
; PLAN: r0=193(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=152(y), r7=70(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 152
LDI r7, 70
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
