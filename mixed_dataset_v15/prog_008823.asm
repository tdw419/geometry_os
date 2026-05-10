; DESCRIPTION: Composite: Places a red circle of radius 10 at center (392, 171) then Renders a cyan box of size 101x21 starting at (255, 164).
; PLAN: r0=392(x), r1=171(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=164(y), r7=101(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 171
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 164
LDI r7, 101
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
