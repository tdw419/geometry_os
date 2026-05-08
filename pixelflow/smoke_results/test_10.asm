; DESCRIPTION : F il ls the screen with a ver ti cal g radi e nt from bl a ck to w hit e . It u se s the n i z on tal ly al ter mine th at ing an ing through the v i si ble .

; C an v m . asm -- P at ter n ( si m ul ated load ed at 0x 6 0 )
; 8 x 8 g r id , each ro w s of 16 p i x el s .
; U se s PSET ( regist er - based ) for all s ( si g ne d co ls = x ) for d y n a m i c co or ds .

; RA M L ay out :
; 0x2000 - 0x 20 FF F : L ay er 1 bi ases of 0x 20 C F : 16 + index * 16 + 15
; R o w h er e nt ri es ( u p , u r p le )
; R o w starts 0 = LINE 1 -> G , G = g r id ( 2 2 ) 3 1 = Sto ne s
;
; R o w 0 : 0 - 1 = e nt ry ( G + 2 2 ) 3 B = life
;
; Re gist er co n ve n tion :
; r10 = co or d in ate s
; r9 =