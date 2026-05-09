; DESCRIPTION: Composite: Places a cyan dot at position (387, 166) then Renders a red box of size 32x55 starting at (148, 46).
; PLAN: r0=387(x), r1=166(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=46(y), r7=32(width), r8=55(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 166
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 46
LDI r7, 32
LDI r8, 55
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
