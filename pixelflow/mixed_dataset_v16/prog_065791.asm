; DESCRIPTION: Composite: Places a orange 42x12 rectangle at position (315, 79) then Creates a cyan circular shape at (502, 213) with radius 10.
; PLAN: r0=315(x), r1=79(y), r2=42(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=213(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 79
LDI r2, 42
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 213
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
