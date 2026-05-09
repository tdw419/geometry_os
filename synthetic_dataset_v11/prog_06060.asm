; DESCRIPTION: Composite: . Then Places a cyan 39x110 rectangle at position (30, 111). Then Places a orange dot at position (245, 46).
; PLAN: r0=30(x), r1=111(y), r2=39(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=245(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 39x110 rectangle at position (30, 111).
; PLAN: r0=30(x), r1=111(y), r2=39(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 111
LDI r2, 39
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (245, 46).
; PLAN: r0=245(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
