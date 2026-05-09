; DESCRIPTION: Composite: Sets a single cyan pixel at (288, 81) then Places a yellow 93x63 rectangle at position (374, 56).
; PLAN: r0=288(x), r1=81(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=56(y), r7=93(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 81
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 56
LDI r7, 93
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
