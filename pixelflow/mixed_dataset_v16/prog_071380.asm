; DESCRIPTION: Composite: Creates a cyan circular shape at (380, 133) with radius 68 then Places a cyan 72x63 rectangle at position (42, 108).
; PLAN: r0=380(x), r1=133(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=108(y), r7=72(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 133
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 108
LDI r7, 72
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
